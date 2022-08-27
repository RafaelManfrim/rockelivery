defmodule Rockelivery.Stack do
  use GenServer

  # Server (Callbacks)
  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # SYNC
  @impl true
  def handle_call({:push, element}, _from, stack) do
    new_stack = [element | stack]
    {:reply, new_stack, new_stack}
  end

  # SYNC
  @impl true
  def handle_call(:pop, _from, [head, tail]) do
    {:reply, head, tail}
  end

  # SYNC
  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  # ASYNC
  @impl true
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end
