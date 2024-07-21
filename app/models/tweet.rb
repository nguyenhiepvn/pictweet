class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many  :comments   # Association with comments table
  
  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  #バリデーションの後で「puts_sample」を実行
  after_validation :puts_sample
  #「pust_sample」というcallbackを登録
  private
    def puts_sample
      puts 'sample'
    end

end
