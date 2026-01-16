// src/migrations/000018-create-orders.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Orders', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      contactId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Contacts',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      orderStatus: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      totalValue: {
        type: Sequelize.FLOAT,
        allowNull: true,
      },
      finalAttachment: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      sellerId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      paymentType: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      deliveryDate: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      couponId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Coupons',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      },
      operationTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'OperationTypes',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      requestDate: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      rentalStartDate: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      rentalExpectedReturnDate: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      rentalEndDate: {
        type: Sequelize.DATE,
        allowNull: true,
      },
      active: {
        type: Sequelize.BOOLEAN,
        defaultValue: true,
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

    await queryInterface.addIndex('Orders', ['companyId']);
    await queryInterface.addIndex('Orders', ['contactId']);
    await queryInterface.addIndex('Orders', ['sellerId']);
    await queryInterface.addIndex('Orders', ['couponId']);
    await queryInterface.addIndex('Orders', ['operationTypeId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Orders');
  },
};