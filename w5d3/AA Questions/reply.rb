require_relative './questions_database.rb'
require_relative './question_follow.rb'
require_relative './question_like.rb'
require_relative './student.rb'
require_relative './question.rb'

class Reply
    attr_reader :id, :student_id, :parent_id, :question_id
    def self.find_by_user_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
           student_id = ?
        SQL
        reply.nil? ? nil : Reply.new(reply.first)
    end

    def self.find_by_question_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            replies
        WHERE
           question_id = ?
        SQL
        reply.nil? ? nil : Reply.new(reply.first)
    end

    def self.find_by_parent_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            *
        FROM
            replies
        WHERE
           parent_id = ?
        SQL
        reply.nil? ? nil : Reply.new(reply.first)
    end

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
                replies
            WHERE
                id = ?
            SQL
        reply.nil? ? nil : Reply.new(reply.first) 
    end

    def initialize(options = {})
        @id = options['id']
        @student_id = options['student_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @body = options['body']
    end

    def author
        Student.find_by_id(student_id)  
    end

    def question
        Question.find_by_id(question_id)  
    end

    def parent_replies
        Reply.find_by_id(parent_id)  
    end

    def child_replies
        Reply.find_by_parent_id(id)  
    end
end

