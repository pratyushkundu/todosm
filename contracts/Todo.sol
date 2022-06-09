// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract TodoList{

    struct Todo{
      string title;
      string description;
      uint256 timeCreatedAt;
      address createdBy;
    }
    mapping(address=>Todo[]) public Todos;

    function create(string memory _title,string memory _description) external{

        Todos[msg.sender].push(Todo({
            title:_title,
            description:_description,
            timeCreatedAt:block.timestamp,
            createdBy:msg.sender
        }));
    }

    function updateTodo(uint _index,string memory _title,string memory _description) external{
        Todo storage todo = Todos[msg.sender][_index];
        todo.title=_title;
        todo.description = _description;
        todo.timeCreatedAt= block.timestamp;
    }
  
    
    function getList(uint _index) external  view returns(Todo memory){
            Todo storage todo = Todos[msg.sender][_index];
            return todo;
    }

    function deleteTodo(uint index) external{
        delete Todos[msg.sender][index];
    }
     
    function getTaskCount() external view returns (uint256)
    {
        return Todos[msg.sender].length;
    } 
}