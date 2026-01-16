// src/migrations/000011-create-licenses.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Licenses', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
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
      type: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      status: {
        type: Sequelize.ENUM('active', 'suspended', 'expired'),
        defaultValue: 'active',
        allowNull: true,
      },
      startDate: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      isCurrent: {
        type: Sequelize.BOOLEAN,
        defaultValue: true,
        allowNull: true,
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

    await queryInterface.addIndex('Licenses', ['companyId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Licenses');
  },
};