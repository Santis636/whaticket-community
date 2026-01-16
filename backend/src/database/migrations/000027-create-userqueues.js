// src/migrations/000027-create-userqueues.js
'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('UserQueues', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      userId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      queueId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'Queues',
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

    await queryInterface.addIndex('UserQueues', ['userId', 'queueId'], {
      unique: true,
      name: 'userqueues_user_queue_unique',
    });

    await queryInterface.addIndex('UserQueues', ['userId']);
    await queryInterface.addIndex('UserQueues', ['queueId']);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('UserQueues', 'userqueues_user_queue_unique');
    await queryInterface.dropTable('UserQueues');
  },
};