import {
  Table,
  Column,
  Model,
  PrimaryKey,
  AutoIncrement,
  AllowNull,
  Unique,
  Default,
  CreatedAt,
  UpdatedAt,
  DataType,
  ForeignKey
} from "sequelize-typescript";
import Company from "./Company";

@Table({
  indexes: [
    {
      unique: true,
      fields: ["companyId", "couponCode"]
    }
  ]
})
class Coupon extends Model<Coupon> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @AllowNull(false)
  @Column
  couponCode: string;

  // porcentagem de desconto (ex: 10 = 10%)
  @AllowNull(false)
  @Column(DataType.FLOAT)
  percentage: number;

  @AllowNull(false)
  @Column(DataType.DATE)
  startDate: Date;

  @AllowNull(false)
  @Column(DataType.DATE)
  endDate: Date;

  @Default(true)
  @Column
  active: boolean;

  @ForeignKey(() => Company)
  @AllowNull(false)
  @Column
  companyId: number;

  @AllowNull(false)
  @CreatedAt
  createdAt: Date;

  @AllowNull(false)
  @Column
  createdBy: string;

  @UpdatedAt
  updatedAt: Date;

  @Column
  updatedBy: string;
}

export default Coupon;
