class Ahoy::Event < ApplicationRecord 
  # include Ahoy::QueryMethods  <-- REMOVA ESTA LINHA
  self.table_name = "ahoy_events"
  belongs_to :visit
  belongs_to :user, optional: true

  serialize :properties, coder: JSON
end
