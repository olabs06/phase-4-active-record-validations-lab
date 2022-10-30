class Post < ApplicationRecord
    validates :title, presence: true, exclusion: {in: %w(True Facts)}
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "is not included in the list"}
    validate :clickbaity

      
    def clickbaity
        if not match_pattern? title
            errors.add(:title, "is not click baity enough!!!!")
        end
    end

    private 

    def match_pattern? title
        /Won't Believe|Secret|Top \d|Guess/i.match?(title)
    end
end
