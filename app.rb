require_relative "./lib/cohort_repo"
require_relative "./lib/database_connection"

class Application

    def initialize(databasename,kernalsub,cohortrepo)
        DatabaseConnection.connect(databasename)
        @cohort_repo = cohortrepo
        @io = kernalsub
    
    end
    
    def run2
        @io.puts"select cohort"
        input1 = @io.gets.chomp
        @io.puts "#{@cohort_repo.find_names_by_cohort(input1)}"
    end

    def run
        @io.puts"select cohort"
        input1 = @io.gets.chomp
        new_array = @cohort_repo.find_names_by_cohort_2(input1)
        new_var = new_array.map {|student| student.name}.join("\n")
        @io.puts new_var
    end

end

if __FILE__ == $0
    app = Application.new(
    'student_directory_2',
    Kernel,
    CohortsRepo.new,
    )
    app.run
end


