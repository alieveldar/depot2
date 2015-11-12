class Product < ActiveRecord::Base
validates :title, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.1}
validates :title, uniqueness: true
#validates :image_url, allow_blank: true, format: {
 #with: %r{\.(gif|jpg|jpeg|tif|png)$}i, 
# message: 'Адрес должен быть указан на изображение в формате гиф джипег и тдэ'
 #}
end
