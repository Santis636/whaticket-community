// src/migrations/000010-create-coupons.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Coupons', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      couponCode: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      percentage: {
        type: Sequelize.FLOAT,
        allowNull: false,
      },
      startDate: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      endDate: {
        type: Sequelize.DATE,
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

    await queryInterface.addIndex('Coupons', ['companyId', 'couponCode'], {
      unique: true,
      name: 'coupons_company_code_unique',
    });

    await queryInterface.addIndex('Coupons', ['companyId']);
    await queryInterface.addIndex('Coupons', ['couponCode']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('Coupons', 'coupons_company_code_unique');
    await queryInterface.dropTable('Coupons');
  },
};