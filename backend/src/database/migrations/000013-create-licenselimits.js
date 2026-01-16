// src/migrations/000013-create-licenselimits.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('LicenseLimits', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      licenseId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Licenses',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      resource: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      limit: {
        type: Sequelize.INTEGER,
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

    await queryInterface.addIndex('LicenseLimits', ['licenseId']);
    await queryInterface.addIndex('LicenseLimits', ['resource']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('LicenseLimits');
  },
};