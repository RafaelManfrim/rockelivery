defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 27,
      address: "Rua Carvalho",
      cep: "12345678",
      cpf: "11111111111",
      name: "Rafael",
      password: "123456",
      email: "rafael@rockelivery.com"
    }
  end
end
