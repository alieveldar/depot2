class Product < ActiveRecord::Base
validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.1}
validates :title, uniqueness: true
validates :image_url, allow_blank: true, format: {
 with: /[.](gif|jpg|jpeg|tif|png)\z/i, 
 message: 'Адрес должен быть указан на изображение в формате гиф джипег и тдэ'
 }
 has_many :lime_items
 before_destroy :ensure_not_referenced_by_any_line_item
 private
 # убеждаемся в оствутствии товарных похзиций, ссылающихся на данный товар
 def ensure_not_referbced_by_any_line_item
 	if line_items.empty?
 		return true
 	else
 		errors.add(:base, 'существуют товарные позиции')
 		return false
 	end
 end
 
end
