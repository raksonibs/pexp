defmodule Physics do
  use Application

  def start(_type, _args) do 
    import Supervisor.Spec, warn: false

    children = [
      worker(Physics.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Physics.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


# supervision tree. start called by mix when running accpliation.
# create work which is child process invoking ecto physics.repo.
# when you call use, you unwrap macros assocaited with module
# ecto.repo decalres number of methods, including startlink
# one_for_one: restart child on termiantion, restart all, rest_for_one: when child dies, all child created after one died are restarted
