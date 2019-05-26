class Rank < ApplicationRecord
  self.table_name = :ranking

  protected

  def readonly?
    true
  end
end
