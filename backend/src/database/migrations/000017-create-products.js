// src/migrations/000017-create-products.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Products', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      description: {
        type: Sequelize.TEXT,
        allowNull: true,
      },
      identification: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      status: {
        type: Sequelize.STRING,
        allowNull: false,
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
      active: {
        type: Sequelize.BOOLEAN,
        defaultValue: true,
        allowNull: true,
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

    await queryInterface.addIndex('Products', ['companyId', 'identification'], {
      unique: true,
      name: 'products_company_identification_unique',
    });

    await queryInterface.addIndex('Products', ['companyId']);
    await queryInterface.addIndex('Products', ['productTypeId']);
    await queryInterface.addIndex('Products', ['status']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Products', 'products_company_identification_unique');
    await queryInterface.dropTable('Products');
  },
};