class OrderForm
  include ActiveModel::Model
  # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :item_id, :post_code, :region_of_origin_id, :municipality, :address, :building_name, :telephone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # paymentモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_of_origin_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
      Payment.create(order_id: order.id, post_code: post_code, region_of_origin_id: region_of_origin_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number)
    end
end
