class Project < ApplicationRecord
  belongs_to :entity

  def xurl
    "#{owner_name}/#{name}"
  end

  def owner_name
    entity.login
  end
end
