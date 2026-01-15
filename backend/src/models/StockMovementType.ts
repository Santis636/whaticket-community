import { AllowNull, AutoIncrement, Column, CreatedAt, Model, PrimaryKey, Table, UpdatedAt } from "sequelize-typescript";

@Table
class StockMovementType extends Model<StockMovementType> {
  @PrimaryKey
  @AutoIncrement
  @Column
  id: number;

  @Column
  name: string; // entrada | saída | devolução | ajuste

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
export default StockMovementType;