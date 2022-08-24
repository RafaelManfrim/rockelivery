defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 27,
      "address" => "Rua Carvalho",
      "cep" => "12345678",
      "cpf" => "11111111111",
      "name" => "Rafael",
      "password" => "123456",
      "email" => "rafael@rockelivery.com"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua Carvalho",
      cep: "12345678",
      cpf: "11111111111",
      name: "Rafael",
      password: "123456",
      email: "rafael@rockelivery.com",
      id: "fdf23328-57c4-4885-935a-361e9343d4f0"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
