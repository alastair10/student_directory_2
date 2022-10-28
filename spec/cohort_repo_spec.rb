$LOAD_PATH << "lib"
require 'cohort_repo'
require_relative '../app'
require 'database_connection'


def reset_students_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2' })
    connection.exec(seed_sql)
end

RSpec.describe CohortsRepo do
  
    before(:each) do 
        reset_students_table
    end
    
    it "tests find by method" do
        repo1 = CohortsRepo.new
        expect(repo1.find_names_by_cohort("december")).to eq "december: bill gates, robin-resit"
    end

    it "tests the find by method again" do
      repo1 = CohortsRepo.new
      expect(repo1.find_names_by_cohort_2("december").length).to eq 2
    end

    it "app test" do
        kernaldouble = double :kernaldouble
        repo1 = CohortsRepo.new

        expect(kernaldouble).to receive(:puts).with("select cohort")
        expect(kernaldouble).to receive(:gets).and_return("october")
        #expect(kernaldouble).to receive(:puts).with("december: bill gates, robin-resit")
        expect(kernaldouble).to receive(:puts).with("october: robin, alastair")
    
        app1 = Application.new('student_directory_2', kernaldouble, repo1)
        app1.run2
        #expect(repo1.find_names_by_cohort("december")).to eq "december: bill gates, robin-resit"
        expect(repo1.find_names_by_cohort("october")).to eq "october: robin, alastair"

    end

    it "app test2" do
        kernaldouble = double :kernaldouble
        repo1 = CohortsRepo.new

        expect(kernaldouble).to receive(:puts).with("select cohort")
        expect(kernaldouble).to receive(:gets).and_return("october")
        expect(kernaldouble).to receive(:puts).with("robin\nalastair")
    
        app1 = Application.new('student_directory_2', kernaldouble, repo1)
        app1.run

        expect(repo1.find_names_by_cohort_2("october").length).to eq 2
    end


end
