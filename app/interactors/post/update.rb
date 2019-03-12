module Post
  class Update
    include Interactor

    delegate :params, :post, :current_user, to: :context

    before do
      update_post
    end

    def call
      context.fail!(errors: context.errors) if context.errors.present?
    end

    private

    def update_post
      return if context.post.update(params)

      context.errors = post.errors.full_messages.join(", ")
    end
  end
end
