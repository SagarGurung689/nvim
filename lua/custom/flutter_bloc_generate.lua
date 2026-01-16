local M = {}

-- Convert PascalCase → snake_case
local function snake_case(str)
  return str:gsub('(%l)(%u)', '%1_%2'):lower()
end

function M.create_bloc()
  local name = vim.fn.input 'Bloc name: '
  if name == '' then
    print '❌ Cancelled'
    return
  end

  -- SAFE directory resolution (NO netrw)
  local dir
  if vim.fn.expand '%' ~= '' then
    dir = vim.fn.expand '%:p:h' -- from file
  else
    dir = vim.fn.getcwd() -- from tree / empty buffer
  end

  local snake = snake_case(name)

  local bloc_file = dir .. '/' .. snake .. '_bloc_bloc.dart'
  local event_file = dir .. '/' .. snake .. '_bloc_event.dart'
  local state_file = dir .. '/' .. snake .. '_bloc_state.dart'

  -- ================= Bloc =================
  vim.fn.writefile({
    "import 'package:bloc/bloc.dart';",
    "import 'package:equatable/equatable.dart';",
    '',
    "part '" .. snake .. "_bloc_event.dart';",
    "part '" .. snake .. "_bloc_state.dart';",
    '',
    'class ' .. name .. 'BlocBloc extends Bloc<' .. name .. 'BlocEvent, ' .. name .. 'State> {',
    '  ' .. name .. 'BlocBloc() : super(' .. name .. 'Initial()) {',
    '    on<' .. name .. 'Requested>((event, emit) async {',
    '      emit(' .. name .. 'Loading());',
    '    });',
    '  }',
    '}',
  }, bloc_file)

  -- ================= Event =================
  vim.fn.writefile({
    "part of '" .. snake .. "_bloc_bloc.dart';",
    '',
    'sealed class ' .. name .. 'BlocEvent extends Equatable {',
    '  const ' .. name .. 'BlocEvent();',
    '',
    '  @override',
    '  List<Object> get props => [];',
    '}',
    '',
    'final class ' .. name .. 'Requested extends ' .. name .. 'BlocEvent {',
    '  const ' .. name .. 'Requested();',
    '}',
  }, event_file)

  -- ================= State =================
  vim.fn.writefile({
    "part of '" .. snake .. "_bloc_bloc.dart';",
    '',
    'sealed class ' .. name .. 'State extends Equatable {',
    '  const ' .. name .. 'State();',
    '',
    '  @override',
    '  List<Object> get props => [];',
    '}',
    '',
    'final class ' .. name .. 'Initial extends ' .. name .. 'State {}',
    '',
    'final class ' .. name .. 'Loading extends ' .. name .. 'State {}',
    '',
    'final class ' .. name .. 'Success extends ' .. name .. 'State {}',
    '',
    'final class ' .. name .. 'Failure extends ' .. name .. 'State {}',
  }, state_file)

  print('✅ Bloc created in: ' .. dir)
end

return M
