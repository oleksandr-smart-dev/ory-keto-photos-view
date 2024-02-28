
class User < ApplicationRecord
  def has_permission?(action, resource)
    # Make a request to the Ory Keto API to check if the user has the permission
    response = Ory::Keto::PoliciesApi.new.get_allowed(nil, user_id: self.id, resource: resource, permission: action)

    !response.empty?
  rescue Ory::Keto::ApiError => e
    Rails.logger.error("Error checking permission: #{e}")
    false  # Return false in case of error
  end
end