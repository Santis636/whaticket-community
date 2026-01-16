// src/migrations/000019-create-orderproducttypes.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('OrderProductTypes', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      orderId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Orders',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      productTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'ProductTypes',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      quantity: {
        type: Sequelize.INTEGER,
        allowNull: true,
      },
      value: {
        type: Sequelize.FLOAT,
        allowNull: true,
      },
      companyId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Companies',
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

    await queryInterface.addIndex('OrderProductTypes', ['orderId', 'productTypeId'], {
      unique: true,
      name: 'orderproducttypes_order_producttype_unique',
    });

    await queryInterface.addIndex('OrderProductTypes', ['companyId']);
    await queryInterface.addIndex('OrderProductTypes', ['orderId']);
    await queryInterface.addIndex('OrderProductTypes', ['productTypeId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('OrderProductTypes', 'orderproducttypes_order_producttype_unique');
    await queryInterface.dropTable('OrderProductTypes');
  },
};