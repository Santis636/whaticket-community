// src/migrations/000020-create-orderproducts.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('OrderProducts', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      productId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Products',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
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
      orderProductTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'OrderProductTypes',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      status: {
        type: Sequelize.STRING,
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

    await queryInterface.addIndex('OrderProducts', ['orderId', 'productId'], {
      unique: true,
      name: 'orderproducts_order_product_unique',
    });

    await queryInterface.addIndex('OrderProducts', ['companyId']);
    await queryInterface.addIndex('OrderProducts', ['orderId']);
    await queryInterface.addIndex('OrderProducts', ['productId']);
    await queryInterface.addIndex('OrderProducts', ['orderProductTypeId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('OrderProducts', 'orderproducts_order_product_unique');
    await queryInterface.dropTable('OrderProducts');
  },
};