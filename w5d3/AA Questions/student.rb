require_relative './questions_database.rb'
require_relative './question.rb'
require_relative './question_follow.rb'
require_relative './question_like.rb'
require_relative './reply.rb'


class Student

    attr_reader :id, :fname, :lname

    def self.find_by_id(id)
        person = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                students
            WHERE
                id = ?
        SQL
        person.nil? ? nil : Student.new(person.first)
        # options.map { |option| Student.new(option) 
    end
    

    def self.find_by_name(fname, lname)
        person = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            students
        WHERE
            fname = ? AND lname = ?
        SQL
        person.nil? ? nil : Student.new(person.first)
    end


    def initialize(options = {})
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end


    def authored_questions
        Question.find_by_author_id(find_by_id)
    end


    def authored_replies
        Reply.find_by_user_id(id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_student_id(id)
    end
    


end
