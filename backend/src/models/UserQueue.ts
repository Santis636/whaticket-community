import {
  Table,
  Column,
  CreatedAt,
  UpdatedAt,
  Model,
  ForeignKey
} from "sequelize-typescript";
import Queue from "./Queue";
import User from "./User";

// adicionar o clinte interno
@Table
class UserQueue extends Model<UserQueue> {
  @ForeignKey(() => User)
  @Column
  userId: number;

  @ForeignKey(() => Queue)
  @Column
  queueId: number;

  @CreatedAt
  createdAt: Date;

  @UpdatedAt
  updatedAt: Date;
}

export default UserQueue;
