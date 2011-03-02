class Comment < ActiveRecord::Base
  belongs_to :note
  
  # def preview
  #   truncate(body, :length => 10, :omission => '... (continued)')
  # end
  
  
  def preview(max_sentences = 3, max_words = 30)
    # Take first 3 setences (blah. blah. blah)
    three_sentences = body.split('. ').slice(0, max_sentences).join('. ')
    # Take first 50 words of the above
    shortened = three_sentences.split(' ').slice(0, max_words).join(' ')
    return shortened # bah, explicit return is evil
  end
  
end
