// src/migrations/000008-create-producttypes.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('ProductTypes', {
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
      saleValue: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
        allowNull: false,
      },
      rentValue: {
        type: Sequelize.FLOAT,
        defaultValue: 0,
        allowNull: false,
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

    await queryInterface.addIndex('ProductTypes', ['companyId', 'name'], {
      unique: true,
      name: 'producttypes_company_name_unique',
    });

    await queryInterface.addIndex('ProductTypes', ['companyId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('ProductTypes', 'producttypes_company_name_unique');
    await queryInterface.dropTable('ProductTypes');
  },
};