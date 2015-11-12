require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products
	test "product atributes must not be empty" do
	#Свойства товара не должны быть пустыми
	product = Product.new
	assert product.invalid?
	assert product.errors[:title].any?
	assert product.errors[:description].any?
	assert product.errors[:price].any?
	assert product.errors[:image_url].any?
    end
       test "product price must be positive" do
       #Цены должны быть позитивными
        product = Product.new(title:          "My books Title",
			description: "yyy",
			image_url: 	"zzz.jpg")

       product.price = -1
assert product.invalid?
assert_equal "must be greater than or equal to 0.1",
product.errors[:price].join(': ')
		#Должна быть больше или равна 0.01
product.price = 0
assert product.invalid?
assert_equal "must be greater than or equal to 0.1",
	product.errors[:price].join(': ')
product.price = 1
assert product.valid?
end
def new_product(image_url)
	Product.new(	title:			"My Book Title",
			description:            "yyy",
			price: 1,
			image_url: image_url)
end

test "image url" do
# url изображения
ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
		http://a.b.c/x/y/z/fred.gif }
bad = %w{ fred.doc fred.gif/more fred.gif.more }

ok.each do |name|
	assert new_product(name).valid?, "#{name} shouldn't be invalid"
					# не должно быть неприемлемым
end

bad.each do |name|
	assert new_product(name).invalid?, "#{name} shouldn't be valid"
					# не должно быть приемлемым
end
end
   test "product is not valid without a unique title" do
   	# если у товара нет уникального названия, то он недопустим
   	product = Product.new(title: products(:ruby).title,
   			description:  "yyy"
   			price:   1,
   			image_url:     "fred.gif")
   	assert !product.save
   	assert_equal "has already been taken", product.errors[:title].join('; ')
   	       # уже было использовано
   	   end
end
