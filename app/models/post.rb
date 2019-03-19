class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, {:length =>{:minimum => 250 }})
  validates(:summary, {:length =>{:maximum => 250 }})
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    if self.title
      clickbait_array = ["Won't Believe", "Secrets", "Top", "Guess"]
      if !clickbait_array.any? {|ele| self.title.include?(ele)}
        errors.add(:title, "must be clickbait")
      end
    else
      errors.add(:title, "must be clickbait")
    end
  end
end
