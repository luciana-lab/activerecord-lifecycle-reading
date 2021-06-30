class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  # Whenever you are modifying an attribute of the model, use before_validation.
  before_validation :make_title_case

  # If you are doing some other action, then use before_save.
  # actions that need to occur that aren't modifying the model itself.
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def email_author_about_post

  end

end
