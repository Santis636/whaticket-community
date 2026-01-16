// src/migrations/000007-create-rolepermissions.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('RolePermissions', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      roleId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Roles',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      permissionId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Permissions',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      createdBy: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedBy: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('RolePermissions', ['roleId', 'permissionId'], {
      unique: true,
      name: 'rolepermissions_role_permission_unique',
    });

    await queryInterface.addIndex('RolePermissions', ['roleId']);
    await queryInterface.addIndex('RolePermissions', ['permissionId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('RolePermissions', 'rolepermissions_role_permission_unique');
    await queryInterface.dropTable('RolePermissions');
  },
};