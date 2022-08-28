# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rockelivery.Repo.insert!(%Rockelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Rockelivery.{Item, Order, Repo, User}

user = %User{
  age: 27,
  address: "Rua Carvalho",
  name: "Rafael",
  cep: "12345678",
  cpf: "98765432101",
  email: "rafael@rockelivery.com",
  password: "123456"
}

%User{id: user_id, address: address} = Repo.insert!(user)

item1 = %Item{
  category: "food",
  description: "Mingau de chocolate",
  price: Decimal.new("8.99"),
  photo: "priv/photos/mingau_de_chocolate.png"
}

item2 = %Item{
  category: "food",
  description: "Coxinha de frango",
  price: Decimal.new("5.99"),
  photo: "priv/photos/coxinha_de_frango.png"
}

Repo.insert!(item1)
Repo.insert!(item2)

order = %Order{
  user_id: user_id,
  items: [item1, item1, item2],
  address: address,
  comments: "Com ketchup",
  payment_method: :money
}

Repo.insert!(order)
