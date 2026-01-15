import { AllowNull, AutoIncrement, Column, Model, PrimaryKey, Table } from "sequelize-typescript";

@Table
class Feature extends Model<Feature>{
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @AllowNull(false)
    @Column
    name: string;
}
export default Feature;