require_relative './student.rb'
require_relative './questions_database.rb'
require_relative './question_follow.rb'
require_relative './question_like.rb'
require_relative './reply.rb'

class QuestionFollow

    def self.find_by_id(id)
        follow = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions_follow
            WHERE
                id = ?
        SQL
        follow.nil? ? nil : QuestionFollow.new(follow.first) 
    end


    def self.followers_for_question_id(question_id)
        followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                students
            JOIN
                questions_follows ON students.id = questions_follows.student_id
            WHERE
                questions_follows.question_id = ?
        SQL
        # follow.nil? ? nil : Follow.new(follow.first) 
        followers.map { |follower| Student.new(follower) }
    end
    
    def self.followed_question_for_student_id(user_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            questions
        JOIN
            questions_follows ON questions.id = questions_follows.question_id
        WHERE
            questions_follows.student_id = ?
    SQL
    # follow.nil? ? nil : Follow.new(follow.first) 
    followers.map { |follower| Question.new(follower) }
end
    def self.most_followed_questions(n)
        followers = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                questions
            JOIN
                questions_follows ON questions_follows.question_id = questions.id
            GROUP BY
                questions.id
            ORDER BY
                COUNT(*) DESC
            LIMIT
                ?
        SQL
        # follow.nil? ? nil : Follow.new(follow.first) 
        followers.map { |follower| Question.new(follower) }
    end


    
    def initialize(options = {})
        @id = options['id']
        @student_id = options['student_id']
        @question_id = options['question_id']
    end
end