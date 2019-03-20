module Posts
  class Create
    include Interactor

    delegate :params, :current_user, to: :context

    before do
      context.post = create_post
    end

    def call
      context.fail!(errors: context.errors) if context.errors.present?
    end

    private

    def create_post
      post ||= current_user.posts.create(params)

      return post if post.present? && post.save

      context.errors = post.errors.full_messages.join(", ")
    end
  end
end
