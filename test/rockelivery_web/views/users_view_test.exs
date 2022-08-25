defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true
  import Phoenix.View
  import Rockelivery.Factory
  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"
    response = render(UsersView, "create.json", user: user, token: token)

    assert %{
             message: "User created!",
             token: "xpto1234",
             user: %Rockelivery.User{
               address: "Rua Carvalho",
               age: 27,
               cep: "12345678",
               cpf: "11111111111",
               email: "rafael@rockelivery.com",
               id: "fdf23328-57c4-4885-935a-361e9343d4f0",
               inserted_at: nil,
               name: "Rafael",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
