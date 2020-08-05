require_relative './questions_database.rb'
require_relative './question_follow.rb'
require_relative './student.rb'
require_relative './reply.rb'
require_relative './question.rb'



class Like

    def self.find_by_id(id)
        like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        like.nil? ? nil : like.new(like.first) 
    end
    
    def initialize(options = {})
        @id = options['id']
        @student_id = options['student_id']
        @question_id = options['question_id']
    end

end