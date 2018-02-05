class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|

      t.datetime :last_login #上次登录时间
      t.integer :house_id   #编号
      t.integer :contact_phone#看房热线
      t.string :district    #区域
      t.string :address     #产权地址
      t.string :gated_community#封闭式小区
      t.string :landscape   #景观
      t.string :greening    #绿化
      t.string :parking_space#停车位
      t.string :structure   #结构
      t.string :spatial_planning    #空间规划
      t.date :completion_date   #竣工日期
      t.decimal :floor_height_single#单层层高
      t.decimal :floor_height_duplex#复式层高
      t.decimal :property_area  #产权面积（套内）
      t.decimal :actual_area    #实际使用面积（套内）
      t.string :house_upgrade   #硬装
      t.string :house_furnishings #软装
      t.string :gas_pipeline   #燃气管道
      t.string :elevator       #电梯
      t.decimal :public_area    #公摊面积
      t.string :wall_malleability   #套内墙体可塑性
      t.string :house_malleability  #涉品公寓可塑性
      t.string :public_passage      #公共通道
      t.string :sercurity_service   #门禁安保服务
      t.string :charter_costs       #包租成本
      t.decimal :monthly_rent       #月租金
      t.string :payment_method      #支付方式
      t.decimal :price_before_operation   #运营前市价
      t.string :transportation_convinence #出入便利性
      t.string :shopping_convinence       #购物便利性
      t.string :medical_convinence        #医疗便利性
      t.string :education_resources      #教育资源
      t.timestamps
    end
  end
end
