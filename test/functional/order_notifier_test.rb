require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    ord = orders(:one)
    mail = OrderNotifier.received(ord)

    assert_equal "Pragmatic Store Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shiped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match /<td>1<\/td>\s*<td class="titleBook">Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end