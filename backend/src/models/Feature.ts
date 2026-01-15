import { AllowNull, AutoIncrement, Column, Default, Model, PrimaryKey, Table } from "sequelize-typescript";

@Table
class Feature extends Model<Feature>{
    @PrimaryKey
    @AutoIncrement
    @Column
    id: number;

    @AllowNull(false)
    @Column
    name: string;

    @Default(true)
    @Column
    active: true
}
export default Feature;