module Mutations
  class CreatePost < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :content, String, required: true

    field :post, Types::PostType, null: false

    def resolve(id:, title:, content:)
      post = Post.new(id: id, title: title, content: content)
      if post.save!
        { post: post, errors: [] }
      else
        { post: nil, errors: post.errors.full_messages }
      end
    end
  end
end
