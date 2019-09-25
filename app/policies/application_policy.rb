class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  private

  def owner?
    record.user == user
  end

  def list_owner?
    owners = record.map(&:user).uniq
    owners.count == 1 && owners.first == user
  end
end
