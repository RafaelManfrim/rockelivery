defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua Carvalho",
        "cep" => "12345678",
        "cpf" => "11111111111",
        "name" => "Rafael",
        "password" => "123456",
        "email" => "rafael@gmail.com"
      }

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response = conn |> post(Routes.users_path(conn, :create, params)) |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua Carvalho",
                 "cep" => "12345678",
                 "cpf" => "11111111111",
                 "email" => "rafael@gmail.com",
                 "id" => _id,
                 "name" => "Rafael"
               }
             } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{
        "age" => 27,
        "name" => "Rafael",
        "password" => "123456",
        "email" => "rafael@gmail.com"
      }

      response =
        conn |> post(Routes.users_path(conn, :create, params)) |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "address" => ["can't be blank"],
                 "cep" => ["can't be blank"],
                 "cpf" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "fdf23328-57c4-4885-935a-361e9343d4f0"

      response = conn |> delete(Routes.users_path(conn, :delete, id)) |> response(:no_content)

      assert response == ""
    end
  end
end
