// src/migrations/000024-create-settings.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Settings', {
      key: {
        type: Sequelize.STRING,
        primaryKey: true,
        allowNull: false,
      },
      value: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      companyId: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'Companies',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      createdAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
      updatedAt: {
        type: Sequelize.DATE,
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    });

    await queryInterface.addIndex('Settings', ['companyId']);
    await queryInterface.addIndex('Settings', ['key']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Settings');
  },
};