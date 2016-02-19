require "rails_helper"

describe "ActiveRecord Obstacle Course" do
  let(:item_1)  { Item.create(name: "Thing 1") }
  let(:item_2)  { Item.create(name: "Thing 2") }
  let(:item_3)  { Item.create(name: "Thing 3") }
  let(:item_4)  { Item.create(name: "Thing 4") }
  let(:item_5)  { Item.create(name: "Thing 5") }
  let(:item_6)  { Item.create(name: "Thing 6") }
  let(:item_7)  { Item.create(name: "Thing 7") }
  let(:item_8)  { Item.create(name: "Thing 8") }
  let(:item_9)  { Item.create(name: "Thing 9") }
  let(:item_10) { Item.create(name: "Thing 10") }

  let(:item_11) {Item.create(name: "Thing 1")}
  let(:item_12) {Item.create(name: "Thing 2")}
  let(:item_13) {Item.create(name: "Thing 3")}
  let(:item_14) {Item.create(name: "Thing 4")}
  let(:item_15) {Item.create(name: "Thing 5")}

  let!(:order_1)  { Order.create(amount: 200, items: [item_1, item_1, item_2, item_3]) }
  let!(:order_2)  { Order.create(amount: 300, items: [item_1, item_1, item_2, item_3]) }
  let!(:order_3)  { Order.create(amount: 500, items: [item_2, item_3, item_4, item_5]) }
  let!(:order_4)  { Order.create(amount: 500, items: [item_1, item_1, item_2, item_3]) }
  let!(:order_5)  { Order.create(amount: 550, items: [item_1, item_5, item_4, item_7]) }
  let!(:order_6)  { Order.create(amount: 580, items: [item_5, item_8, item_9, item_10]) }
  let!(:order_7)  { Order.create(amount: 600, items: [item_1, item_5, item_7, item_9]) }
  let!(:order_8)  { Order.create(amount: 700, items: [item_2, item_3, item_8, item_9]) }
  let!(:order_9)  { Order.create(amount: 650, items: [item_3, item_4, item_8, item_10]) }
  let!(:order_10) { Order.create(amount: 750, items: [item_1, item_5, item_4, item_7]) }
  let!(:order_11) { Order.create(amount: 800, items: [item_5, item_4, item_7, item_9]) }
  let!(:order_12) { Order.create(amount: 850, items: [item_1, item_3, item_7, item_10]) }
  let!(:order_13) { Order.create(amount: 870, items: [item_2, item_3, item_4, item_7]) }
  let!(:order_14) { Order.create(amount: 900, items: [item_3, item_5, item_8, item_9]) }
  let!(:order_15) { Order.create(amount: 1000, items: [item_1, item_4, item_5, item_7]) }


  ### Here are the docs associated with this lesson: http://guides.rubyonrails.org/active_record_querying.html

  it "finds orders by amount" do
    # ----------------------- Using Ruby -------------------------
    orders_of_500 = Order.all.select { |order| order.amount == 500 }
    orders_of_200 = Order.all.select { |order| order.amount == 200 }
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    #
    # ------------------------------------------------------------

    # Expectation
    expect(orders_of_500.count).to eq(2)
    expect(orders_of_200.count).to eq(1)
  end

  it "finds orders of multiple amounts" do
    # ----------------------- Using Ruby -------------------------
    orders_of_500_and_700 = Order.all.select do |order|
      order.amount == 500 || order.amount == 700
    end

    orders_of_700_and_1000 = Order.all.select do |order|
      order.amount == 700 || order.amount == 1000
    end

    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------

    # ------------------------------------------------------------

    # Expectation
    expect(orders_of_500_and_700.count).to eq(3)
    expect(orders_of_700_and_1000.count).to eq(2)
  end

  it 'finds multiple items by id' do
    ids = [item_1.id, item_2.id, item_4.id]
    # ----------------------- Using Ruby -------------------------
    items = Item.all.select { |item| ids.include?(item.id) }
    # ------------------------------------------------------------


    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(items).to eq([item_1, item_2, item_4])
  end

  it "finds multiple orders by id" do
    ids = [order_1.id, order_3.id, order_5.id, order_7.id]
    # ----------------------- Using Ruby -------------------------
    orders = Order.all.select { |order| ids.include?(order.id) }
    # ------------------------------------------------------------


    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_1, order_3, order_5, order_7])
  end

  it "finds orders within an amount range of 700 to 1000" do
    # ----------------------- Using Ruby -------------------------
    orders_between_700_and_1000 = Order.all.select { |order| order.amount >= 700 && order.amount <= 1000 }
    # ------------------------------------------------------------


    # ------------------ Using ActiveRecord ----------------------
    #Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders_between_700_and_1000).to eq([order_8, order_10, order_11, order_12,
                                              order_13, order_14, order_15])
  end

  it "finds orders with an amount less than 550" do
    # ----------------------- Using Ruby -------------------------
    orders_less_than_550 = Order.all.select { |order| order.amount < 550 }
    # ------------------------------------------------------------


    # ------------------ Using ActiveRecord ----------------------
    #Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders_less_than_550).to eq([order_1, order_2, order_3, order_4])
  end

  it "sorts the orders from most expensive to least expensive" do
    # ----------------------- Using Ruby -------------------------
    orders = Order.all.sort_by { |order| order.amount }.reverse
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_15, order_14, order_13, order_12, order_11,
                          order_10, order_8, order_9, order_7, order_6,
                          order_5, order_4, order_3, order_2, order_1] )
  end

  it "sorts the orders from least expensive to most expensive" do
    # ----------------------- Using Ruby -------------------------
    orders = Order.all.sort_by { |order| order.amount }
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_1, order_2, order_3, order_4, order_5, order_6,
                          order_7, order_9, order_8, order_10, order_11,
                          order_12, order_13, order_14, order_15] )
  end

  it "plucks all values from one column" do
    # ----------------------- Using Ruby -------------------------
    names = Item.all.map(&:name)
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(names).to eq(["Thing 1", "Thing 2", "Thing 3", "Thing 4", "Thing 5",
                         "Thing 7", "Thing 8", "Thing 9", "Thing 10"])
  end

  it "plucks all item names associated with a specific order" do
    # ----------------------- Using Ruby -------------------------
    names = Order.items.all.map(&:name)
    # ------------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(names).to eq([])
  end

  it "returns the average amount for all orders" do
    # ---------------------- Using Ruby -------------------------
    average = (Order.all.map(&:amount).inject(:+)) / (Order.count)
    # -----------------------------------------------------------

    # ------------------ Using ActiveRecord ----------------------
    # Solution goes here
    # ------------------------------------------------------------

    # Expectation
    expect(average).to eq(650)
  end

  it "calculates the total sales" do
    # ---------------------- Using Ruby -------------------------
    total_sales = Order.all.map(&:amount).inject(:+)
    # -----------------------------------------------------------

    # ------------------ Using ActiveRecord ---------------------
    # Solution goes here
    # -----------------------------------------------------------

    # Expectation
    expect(total_sales).to eq(9750)
  end

  it "returns all orders for item_4" do
    # ------------------ Inefficient Solution -------------------
    order_ids = OrderItem.where(item_id: item_4.id).map(&:order_id)
    orders = Order.find(order_ids)
    # -----------------------------------------------------------

    # ------------------ Improved Solution ----------------------
    # Solution goes here
    # -----------------------------------------------------------

    # Expectation
    expect(orders).to eq([order_3, order_5, order_9, order_10, order_11, order_13, order_15])
  end

  it "returns items that are associated with one or more orders" do

    unordered_item = Item.create(name: "Unordered Item")
    unordered_items = [item_11, item_12, item_13, item_14, item_15, unordered_item]

    # ----------------------- Using Ruby -------------------------
    items = Item.all

    ordered_items = items.map do |item|
      item if item.orders.present?
    end

    ordered_items = ordered_items.compact
    # ------------------------------------------------------------

    # ------------------ ActiveRecord Solution ----------------------
    # Solution goes here
    # ---------------------------------------------------------------

    # Expectations
    expect(ordered_items).to eq([item_1, item_2, item_3, item_4, item_5, item_7, item_8, item_9, item_10])
    expect(ordered_items).to_not include(unordered_items)
  end

  it "returns the names of items that are associated with one or more orders" do
    unordered_item = Item.create(name: "Unordered Item")
    unordered_items = [item_11, item_12, item_13, item_14, item_15, unordered_item]

    # ----------------------- Using Ruby -------------------------
    items = Item.all

    ordered_items = items.map do |item|
      item if item.orders.present?
    end

    ordered_items_names = ordered_items.compact.map(&:name)
    # ------------------------------------------------------------

    # ------------------ ActiveRecord Solution ----------------------
    # Solution goes here
    # When you find a solution, experiment with adjusting your method chaining
    # Which ones are you able to switch around without relying on Ruby's Enumerable methods?
    # ---------------------------------------------------------------

    # Expectations
    expect(ordered_items_names).to eq( ["Thing 1", "Thing 2", "Thing 3", "Thing 4", "Thing 5", "Thing 7", "Thing 8", "Thing 9", "Thing 10"])
    expect(ordered_items_names).to_not include( unordered_items )
  end

  xit "returns the names of items that have been ordered without n+1 queries" do
    # What is an n+1 query?
    # This video is older, but the concepts explained are still relevant:
    # http://railscasts.com/episodes/372-bullet

    # Don't worry about the lines containing Bullet. This is how we are detecting n+1 queries.
    Bullet.enable = true
    Bullet.raise = true
    Bullet.start_request

    # ------------------------------------------------------
    orders = Order.all # Edit only this line
    # ------------------------------------------------------

    # Do not edit below this line
    orders.each do |order|
      order.items.each do |item|
        item.name
      end
    end

    # Don't worry about the lines containing Bullet. This is how we are detecting n+1 queries.
    Bullet.perform_out_of_channel_notifications
    Bullet.end_request
  end
end
