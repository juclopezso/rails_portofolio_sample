class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.2]
  def change
    #add reference to the blogs table with topic
    add_reference :blogs, :topic, foreign_key: true
  end
end
