require_relative './questions_database.rb'
require_relative './question_follow.rb'
require_relative './question_like.rb'
require_relative './student.rb'
require_relative './reply.rb'

class Question

    def self.find_by_id(id)
        quest = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        quest.nil? ? nil : Question.new(quest.first)
    end


    def self.find_by_title(title)
        quest = QuestionsDatabase.instance.execute(<<-SQL, title)
            SELECT
                *
            FROM
                questions
            WHERE
                title = ?
        SQL
        quest.nil? ? nil : Question.new(quest.first)
    end


    def self.find_by_author_id(author_id)
        quest = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        quest.nil? ? nil : Question.new(quest.first)
    end


    attr_reader :id, :title, :body, :author_id


    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end  


    def author
        Student.find_by_id(author_id)
    end

    
    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        QuestionFollow.followers_for_question_id(id)
    end



end