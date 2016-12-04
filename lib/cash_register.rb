class CashRegister
    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @last_transaction = price * quantity
        item_name = title.to_s
        @items.concat([item_name] * quantity)
    end

    def apply_discount
        subtotal = @total
        discount = @discount * 0.01
        subtotal = subtotal * discount
        @total = (@total - subtotal).to_i
        return "After the discount, the total comes to $#{@total}." if subtotal > 0
        'There is no discount to apply.'
    end

    attr_reader :items

    def void_last_transaction
        @total -= @last_transaction
    end
end
