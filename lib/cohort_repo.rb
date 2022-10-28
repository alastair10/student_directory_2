

# December: Robin-resit, Bill Gates



class Student
    attr_accessor :id, :name, :cohort_id
end


class Cohort
    attr_accessor :id, :cohort_name, :start_date, :students_array

    #@students_array = []
end


class CohortsRepo

    def find_names_by_cohort(cohortname)
        sql = "Select cohorts.cohort_name, students.name from cohorts join "\
        "students on cohorts.id = students.cohort_id where cohort_name = $1"

        results = DatabaseConnection.exec_params(sql,[cohortname]) 
        return "#{cohortname}: #{results.values[0][1]}, #{results.values[1][1]}"

    end

    def find_names_by_cohort_2(cohortname)
      sql = "Select cohorts.cohort_name, students.name from cohorts join "\
      "students on cohorts.id = students.cohort_id where cohort_name = $1"

      result_set = DatabaseConnection.exec_params(sql,[cohortname])

      cohort = Cohort.new
      cohort.students_array = []#experiment

      cohort.id = result_set.first['id']
      cohort.cohort_name = result_set.first['cohort_name']
      cohort.start_date = result_set.first['start_date']

      result_set.each do |record|
        student = Student.new
        student.name = record['name']
        student.cohort_id = record['cohort_id']

        cohort.students_array << student
      end
      
      return cohort.students_array

    end

end


