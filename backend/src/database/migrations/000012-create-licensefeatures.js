// src/migrations/000012-create-licensefeatures.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('LicenseFeatures', {
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
      featureId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Features',
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

    await queryInterface.addIndex('LicenseFeatures', ['licenseId', 'featureId'], {
      unique: true,
      name: 'licensefeatures_license_feature_unique',
    });

    await queryInterface.addIndex('LicenseFeatures', ['licenseId']);
    await queryInterface.addIndex('LicenseFeatures', ['featureId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('LicenseFeatures', 'licensefeatures_license_feature_unique');
    await queryInterface.dropTable('LicenseFeatures');
  },
};